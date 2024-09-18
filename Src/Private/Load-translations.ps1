# Function to load translations from a JSON file
function Load-Translations {
    param (
        [string]$Language  # The language code for which translations are needed
    )

    # Construct the file path to the JSON file containing translations for the specified language
    $filePath = Join-Path -Path (Join-Path -Path $PSScriptRoot -ChildPath "../../languages") -ChildPath "$Language.json"
    
    # Check if the translation file exists
    if (Test-Path $filePath) {
        # Read the content of the JSON file as a raw string
        $jsonContent = Get-Content -Path $filePath -Raw
        # Convert the JSON string into a PowerShell object and return it
        return $jsonContent | ConvertFrom-Json
    } else {
        # Output an error message if the file does not exist
        Write-Error "Translation file for language '$Language' not found."
        return $null  # Return null if the file is not found
    }
}