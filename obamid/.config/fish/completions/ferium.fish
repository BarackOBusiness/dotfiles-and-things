complete -c ferium -n "__fish_use_subcommand" -s t -l threads -d 'The limit for additional threads spawned by the Tokio runtime' -r
complete -c ferium -n "__fish_use_subcommand" -l github-token -d 'A GitHub personal access token for increasing the GitHub API rate limit' -r
complete -c ferium -n "__fish_use_subcommand" -l config-file -d 'Set the file to read the config from. Does not change the cache and tmp directories' -r -F
complete -c ferium -n "__fish_use_subcommand" -s h -l help -d 'Print help information'
complete -c ferium -n "__fish_use_subcommand" -s V -l version -d 'Print version information'
complete -c ferium -n "__fish_use_subcommand" -f -a "add" -d 'Add a mod to the profile'
complete -c ferium -n "__fish_use_subcommand" -f -a "complete" -d 'Generate shell auto completions to stdout for the specified shell'
complete -c ferium -n "__fish_use_subcommand" -f -a "list" -d 'List all the mods in the profile, and with some their metadata if verbose'
complete -c ferium -n "__fish_use_subcommand" -f -a "modpack" -d 'Add, configure, delete, switch, list, or upgrade modpacks'
complete -c ferium -n "__fish_use_subcommand" -f -a "profile" -d 'Create, configure, delete, switch, or list profiles'
complete -c ferium -n "__fish_use_subcommand" -f -a "remove" -d 'Remove a mod or repository from the profile
Optionally, provide a list of names of the mods to remove'
complete -c ferium -n "__fish_use_subcommand" -f -a "sort" -d 'Sort all your mods in alphabetical order'
complete -c ferium -n "__fish_use_subcommand" -f -a "upgrade" -d 'Download and install the latest version of the mods specified'
complete -c ferium -n "__fish_use_subcommand" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c ferium -n "__fish_seen_subcommand_from add" -l dont-check-game-version -d 'The game version will not be checked for this mod'
complete -c ferium -n "__fish_seen_subcommand_from add" -l dont-check-mod-loader -d 'The mod loader will not be checked for this mod'
complete -c ferium -n "__fish_seen_subcommand_from add" -l dont-add-dependencies -d 'The mod\'s dependencies will not be added'
complete -c ferium -n "__fish_seen_subcommand_from add" -s h -l help -d 'Print help information'
complete -c ferium -n "__fish_seen_subcommand_from add" -s V -l version -d 'Print version information'
complete -c ferium -n "__fish_seen_subcommand_from complete" -s h -l help -d 'Print help information'
complete -c ferium -n "__fish_seen_subcommand_from complete" -s V -l version -d 'Print version information'
complete -c ferium -n "__fish_seen_subcommand_from list" -s v -l verbose -d 'Show information about the mod'
complete -c ferium -n "__fish_seen_subcommand_from list" -s h -l help -d 'Print help information'
complete -c ferium -n "__fish_seen_subcommand_from list" -s V -l version -d 'Print version information'
complete -c ferium -n "__fish_seen_subcommand_from modpack; and not __fish_seen_subcommand_from add; and not __fish_seen_subcommand_from configure; and not __fish_seen_subcommand_from delete; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from switch; and not __fish_seen_subcommand_from upgrade; and not __fish_seen_subcommand_from help" -s h -l help -d 'Print help information'
complete -c ferium -n "__fish_seen_subcommand_from modpack; and not __fish_seen_subcommand_from add; and not __fish_seen_subcommand_from configure; and not __fish_seen_subcommand_from delete; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from switch; and not __fish_seen_subcommand_from upgrade; and not __fish_seen_subcommand_from help" -s V -l version -d 'Print version information'
complete -c ferium -n "__fish_seen_subcommand_from modpack; and not __fish_seen_subcommand_from add; and not __fish_seen_subcommand_from configure; and not __fish_seen_subcommand_from delete; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from switch; and not __fish_seen_subcommand_from upgrade; and not __fish_seen_subcommand_from help" -f -a "add" -d 'Add a modpack to the config'
complete -c ferium -n "__fish_seen_subcommand_from modpack; and not __fish_seen_subcommand_from add; and not __fish_seen_subcommand_from configure; and not __fish_seen_subcommand_from delete; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from switch; and not __fish_seen_subcommand_from upgrade; and not __fish_seen_subcommand_from help" -f -a "configure" -d 'Configure the current modpack\'s output directory
Optionally, provide the output directory as an option'
complete -c ferium -n "__fish_seen_subcommand_from modpack; and not __fish_seen_subcommand_from add; and not __fish_seen_subcommand_from configure; and not __fish_seen_subcommand_from delete; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from switch; and not __fish_seen_subcommand_from upgrade; and not __fish_seen_subcommand_from help" -f -a "delete" -d 'Delete a modpack
Optionally, provide the name of the modpack to delete'
complete -c ferium -n "__fish_seen_subcommand_from modpack; and not __fish_seen_subcommand_from add; and not __fish_seen_subcommand_from configure; and not __fish_seen_subcommand_from delete; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from switch; and not __fish_seen_subcommand_from upgrade; and not __fish_seen_subcommand_from help" -f -a "list" -d 'List all the modpacks'
complete -c ferium -n "__fish_seen_subcommand_from modpack; and not __fish_seen_subcommand_from add; and not __fish_seen_subcommand_from configure; and not __fish_seen_subcommand_from delete; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from switch; and not __fish_seen_subcommand_from upgrade; and not __fish_seen_subcommand_from help" -f -a "switch" -d 'Switch between different modpacks
Optionally, provide the name of the modpack to switch to'
complete -c ferium -n "__fish_seen_subcommand_from modpack; and not __fish_seen_subcommand_from add; and not __fish_seen_subcommand_from configure; and not __fish_seen_subcommand_from delete; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from switch; and not __fish_seen_subcommand_from upgrade; and not __fish_seen_subcommand_from help" -f -a "upgrade" -d 'Download and install the latest version of the modpack'
complete -c ferium -n "__fish_seen_subcommand_from modpack; and not __fish_seen_subcommand_from add; and not __fish_seen_subcommand_from configure; and not __fish_seen_subcommand_from delete; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from switch; and not __fish_seen_subcommand_from upgrade; and not __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c ferium -n "__fish_seen_subcommand_from modpack; and __fish_seen_subcommand_from add" -l output-dir -d 'The Minecraft instance directory to install the modpack to' -r -f -a "(__fish_complete_directories)"
complete -c ferium -n "__fish_seen_subcommand_from modpack; and __fish_seen_subcommand_from add" -l install-overrides -d 'Whether to install the modpack\'s overrides to the output directory
This will override existing files' -r
complete -c ferium -n "__fish_seen_subcommand_from modpack; and __fish_seen_subcommand_from add" -s h -l help -d 'Print help information'
complete -c ferium -n "__fish_seen_subcommand_from modpack; and __fish_seen_subcommand_from add" -s V -l version -d 'Print version information'
complete -c ferium -n "__fish_seen_subcommand_from modpack; and __fish_seen_subcommand_from configure" -l output-dir -d 'The Minecraft instance directory to install the modpack to' -r -f -a "(__fish_complete_directories)"
complete -c ferium -n "__fish_seen_subcommand_from modpack; and __fish_seen_subcommand_from configure" -l install-overrides -d 'Whether to install the modpack\'s overrides to the output directory
This may overwrite existing files' -r
complete -c ferium -n "__fish_seen_subcommand_from modpack; and __fish_seen_subcommand_from configure" -s h -l help -d 'Print help information'
complete -c ferium -n "__fish_seen_subcommand_from modpack; and __fish_seen_subcommand_from configure" -s V -l version -d 'Print version information'
complete -c ferium -n "__fish_seen_subcommand_from modpack; and __fish_seen_subcommand_from delete" -l modpack-name -d 'The name of the modpack to delete' -r
complete -c ferium -n "__fish_seen_subcommand_from modpack; and __fish_seen_subcommand_from delete" -s h -l help -d 'Print help information'
complete -c ferium -n "__fish_seen_subcommand_from modpack; and __fish_seen_subcommand_from delete" -s V -l version -d 'Print version information'
complete -c ferium -n "__fish_seen_subcommand_from modpack; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help information'
complete -c ferium -n "__fish_seen_subcommand_from modpack; and __fish_seen_subcommand_from list" -s V -l version -d 'Print version information'
complete -c ferium -n "__fish_seen_subcommand_from modpack; and __fish_seen_subcommand_from switch" -l modpack-name -d 'The name of the modpack to switch to' -r
complete -c ferium -n "__fish_seen_subcommand_from modpack; and __fish_seen_subcommand_from switch" -s h -l help -d 'Print help information'
complete -c ferium -n "__fish_seen_subcommand_from modpack; and __fish_seen_subcommand_from switch" -s V -l version -d 'Print version information'
complete -c ferium -n "__fish_seen_subcommand_from modpack; and __fish_seen_subcommand_from upgrade" -s h -l help -d 'Print help information'
complete -c ferium -n "__fish_seen_subcommand_from modpack; and __fish_seen_subcommand_from upgrade" -s V -l version -d 'Print version information'
complete -c ferium -n "__fish_seen_subcommand_from profile; and not __fish_seen_subcommand_from configure; and not __fish_seen_subcommand_from create; and not __fish_seen_subcommand_from delete; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from switch; and not __fish_seen_subcommand_from help" -s h -l help -d 'Print help information'
complete -c ferium -n "__fish_seen_subcommand_from profile; and not __fish_seen_subcommand_from configure; and not __fish_seen_subcommand_from create; and not __fish_seen_subcommand_from delete; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from switch; and not __fish_seen_subcommand_from help" -s V -l version -d 'Print version information'
complete -c ferium -n "__fish_seen_subcommand_from profile; and not __fish_seen_subcommand_from configure; and not __fish_seen_subcommand_from create; and not __fish_seen_subcommand_from delete; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from switch; and not __fish_seen_subcommand_from help" -f -a "configure" -d 'Configure the current profile\'s Minecraft version, mod loader, and output directory
Optionally, provide setting(s) to change as option(s)'
complete -c ferium -n "__fish_seen_subcommand_from profile; and not __fish_seen_subcommand_from configure; and not __fish_seen_subcommand_from create; and not __fish_seen_subcommand_from delete; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from switch; and not __fish_seen_subcommand_from help" -f -a "create" -d 'Create a new profile
Optionally provide all the options, to create the profile without the UI
Use the import flag to import mods from another profile'
complete -c ferium -n "__fish_seen_subcommand_from profile; and not __fish_seen_subcommand_from configure; and not __fish_seen_subcommand_from create; and not __fish_seen_subcommand_from delete; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from switch; and not __fish_seen_subcommand_from help" -f -a "delete" -d 'Delete a profile
Optionally, provide the name of the profile to delete'
complete -c ferium -n "__fish_seen_subcommand_from profile; and not __fish_seen_subcommand_from configure; and not __fish_seen_subcommand_from create; and not __fish_seen_subcommand_from delete; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from switch; and not __fish_seen_subcommand_from help" -f -a "list" -d 'List all the profiles with their data'
complete -c ferium -n "__fish_seen_subcommand_from profile; and not __fish_seen_subcommand_from configure; and not __fish_seen_subcommand_from create; and not __fish_seen_subcommand_from delete; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from switch; and not __fish_seen_subcommand_from help" -f -a "switch" -d 'Switch between different profiles
Optionally, provide the name of the profile to switch to'
complete -c ferium -n "__fish_seen_subcommand_from profile; and not __fish_seen_subcommand_from configure; and not __fish_seen_subcommand_from create; and not __fish_seen_subcommand_from delete; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from switch; and not __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c ferium -n "__fish_seen_subcommand_from profile; and __fish_seen_subcommand_from configure" -l game-version -d 'The Minecraft version to check compatibility for' -r
complete -c ferium -n "__fish_seen_subcommand_from profile; and __fish_seen_subcommand_from configure" -l mod-loader -d 'The mod loader to check compatibility for' -r -f -a "{quilt	,fabric	,forge	}"
complete -c ferium -n "__fish_seen_subcommand_from profile; and __fish_seen_subcommand_from configure" -l name -d 'The name of the profile' -r
complete -c ferium -n "__fish_seen_subcommand_from profile; and __fish_seen_subcommand_from configure" -l output-dir -d 'The directory to output mods to' -r -f -a "(__fish_complete_directories)"
complete -c ferium -n "__fish_seen_subcommand_from profile; and __fish_seen_subcommand_from configure" -s h -l help -d 'Print help information'
complete -c ferium -n "__fish_seen_subcommand_from profile; and __fish_seen_subcommand_from configure" -s V -l version -d 'Print version information'
complete -c ferium -n "__fish_seen_subcommand_from profile; and __fish_seen_subcommand_from create" -l import -d 'Copy over the mods from an existing profile
Optionally, provide the name of the profile to import mods from' -r
complete -c ferium -n "__fish_seen_subcommand_from profile; and __fish_seen_subcommand_from create" -l game-version -d 'The Minecraft version to check compatibility for' -r
complete -c ferium -n "__fish_seen_subcommand_from profile; and __fish_seen_subcommand_from create" -l mod-loader -d 'The mod loader to check compatibility for' -r -f -a "{quilt	,fabric	,forge	}"
complete -c ferium -n "__fish_seen_subcommand_from profile; and __fish_seen_subcommand_from create" -l name -d 'The name of the profile' -r
complete -c ferium -n "__fish_seen_subcommand_from profile; and __fish_seen_subcommand_from create" -l output-dir -d 'The directory to output mods to' -r -f -a "(__fish_complete_directories)"
complete -c ferium -n "__fish_seen_subcommand_from profile; and __fish_seen_subcommand_from create" -s h -l help -d 'Print help information'
complete -c ferium -n "__fish_seen_subcommand_from profile; and __fish_seen_subcommand_from create" -s V -l version -d 'Print version information'
complete -c ferium -n "__fish_seen_subcommand_from profile; and __fish_seen_subcommand_from delete" -l profile-name -d 'The name of the profile to delete' -r
complete -c ferium -n "__fish_seen_subcommand_from profile; and __fish_seen_subcommand_from delete" -s h -l help -d 'Print help information'
complete -c ferium -n "__fish_seen_subcommand_from profile; and __fish_seen_subcommand_from delete" -s V -l version -d 'Print version information'
complete -c ferium -n "__fish_seen_subcommand_from profile; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help information'
complete -c ferium -n "__fish_seen_subcommand_from profile; and __fish_seen_subcommand_from list" -s V -l version -d 'Print version information'
complete -c ferium -n "__fish_seen_subcommand_from profile; and __fish_seen_subcommand_from switch" -l profile-name -d 'The name of the profile to switch to' -r
complete -c ferium -n "__fish_seen_subcommand_from profile; and __fish_seen_subcommand_from switch" -s h -l help -d 'Print help information'
complete -c ferium -n "__fish_seen_subcommand_from profile; and __fish_seen_subcommand_from switch" -s V -l version -d 'Print version information'
complete -c ferium -n "__fish_seen_subcommand_from remove" -s h -l help -d 'Print help information'
complete -c ferium -n "__fish_seen_subcommand_from remove" -s V -l version -d 'Print version information'
complete -c ferium -n "__fish_seen_subcommand_from sort" -s h -l help -d 'Print help information'
complete -c ferium -n "__fish_seen_subcommand_from sort" -s V -l version -d 'Print version information'
complete -c ferium -n "__fish_seen_subcommand_from upgrade" -s h -l help -d 'Print help information'
complete -c ferium -n "__fish_seen_subcommand_from upgrade" -s V -l version -d 'Print version information'
