
# Factory Zero Trust IAM
# Lab 2: Identity Access Planning Engine
# DRY RUN ONLY - No Microsoft Graph changes

$projectRoot = Split-Path -Parent $PSScriptRoot
$inputPath = Join-Path $projectRoot "data/hr-employees.csv"
$outputPath = Join-Path $projectRoot "reports/access-plan.csv"

# Define role-based access mappings
$roleMap = @{
    "Production" = @(
        "FZT-AllEmployees",
        "FZT-Production"
    )
    "Quality Assurance" = @(
        "FZT-AllEmployees",
        "FZT-QA"
    )
    "Finance" = @(
        "FZT-AllEmployees",
        "FZT-Finance"
    )
}

$employees = Import-Csv $inputPath

$report = foreach ($employee in $employees) {

    if ($employee.Status -eq "Terminated") {
        $decision = "DISABLE_AND_REVOKE"
        $groups = ""
    }
    elseif ($employee.Status -eq "Active" -and
            $roleMap.ContainsKey($employee.Department)) {
        $decision = "PROPOSE_ASSIGNMENT"
        $groups = $roleMap[$employee.Department] -join ";"
    }
    else {
        $decision = "REVIEW_REQUIRED"
        $groups = ""
    }

    [PSCustomObject]@{
        EmployeeId = $employee.EmployeeId
        Department = $employee.Department
        Decision   = $decision
        Groups     = $groups
    }
}

$report | Format-Table -AutoSize

$report | Export-Csv -Path $outputPath -NoTypeInformation

Write-Host "Dry-run access plan saved to $outputPath"
