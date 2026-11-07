
# Factory Zero Trust IAM
# Lab 3: Access Reconciliation
# DRY RUN ONLY - No Entra ID changes

$root = Split-Path -Parent $PSScriptRoot

$employees = Import-Csv "$root/data/hr-employees.csv"
$access = Import-Csv "$root/data/current-access.csv"

$roleMap = @{
    "Production" = @("FZT-AllEmployees", "FZT-Production")
    "Quality Assurance" = @("FZT-AllEmployees", "FZT-QA")
    "Finance" = @("FZT-AllEmployees", "FZT-Finance")
}

$plan = foreach ($employee in $employees) {

    $current = @(
        $access |
        Where-Object EmployeeId -eq $employee.EmployeeId |
        Select-Object -ExpandProperty GroupName
    )

    if ($employee.Status -eq "Terminated") {
        $desired = @()
        $decision = "DISABLE_AND_REVOKE"
    }
    elseif (
        $employee.Status -eq "Active" -and
        $roleMap.ContainsKey($employee.Department)
    ) {
        $desired = @($roleMap[$employee.Department])
        $decision = "NO_CHANGE"
    }
    else {
        # Fail closed: unknown records require manual review.
        [PSCustomObject]@{
            EmployeeId = $employee.EmployeeId
            Decision = "REVIEW_REQUIRED"
            AddGroups = ""
            RemoveGroups = ""
        }
        continue
    }

    $add = @(
        $desired | Where-Object { $_ -notin $current }
    )

    $remove = @(
        $current | Where-Object {
            $_ -like "FZT-*" -and $_ -notin $desired
        }
    )

    if ($decision -ne "DISABLE_AND_REVOKE" -and
        ($add.Count -gt 0 -or $remove.Count -gt 0)) {
        $decision = "CHANGE_REQUIRED"
    }

    [PSCustomObject]@{
        EmployeeId = $employee.EmployeeId
        Decision = $decision
        AddGroups = $add -join ";"
        RemoveGroups = $remove -join ";"
    }
}

$plan | Format-Table -AutoSize

$plan | Export-Csv "$root/reports/reconciliation-plan.csv" `
    -NoTypeInformation

Write-Host "Access reconciliation report generated."
