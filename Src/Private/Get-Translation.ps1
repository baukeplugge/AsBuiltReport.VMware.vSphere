# Function to translate a given key using the loaded translations
function Get-Translation {
    param (
        [string]$Key  # The key for which translation is required
    )

    # Load translations for the globally set language
    $translations = Load-Translations -Language $Report.Language

    # Check if translations are loaded and if the specified key exists in the translations
    if ($translations -and $translations.PSObject.Properties[$Key]) {
        # Return the translation for the specified key
        return $translations.$Key
    } else {
        # Output a warning if the key is not found in the translations
        Write-Warning "Translation for key '$Key' not found."
        return $Key  # Return the key itself if no translation is found
    }
}