# Satisfactory-Sync

This repository contains a script that automates the synchronization of Satisfactory save files among multiple players using GitHub. The script pulls the latest save file from the repository before launching the game and pushes the updated save file back to GitHub after the game exits. This allows you and your friends to share a common save file and play independently without needing a dedicated host.

## Table of Contents

-   [Prerequisites](#prerequisites)
-   [Setup](#setup)
-   [Usage](#usage)
-   [Notes](#notes)
-   [License](#license)

## Prerequisites

-   **Operating System**: Windows 10 or later
-   **Git**: Installed and added to your system PATH
-   **PowerShell**: Version 5.0 or higher
-   **Satisfactory**: Installed via Steam
-   **GitHub Account**: Access to this repository
-   **Git Authentication**: Set up SSH keys or a credential manager for HTTPS to allow Git operations without manual authentication

## Setup

1. **Clone the Repository**

    Clone this repository to a local directory on your machine:

    ```bash
    git clone https://github.com/MinenMaster/Satisfactory-Sync.git
    ```

2. **Configure the Script**

    - Open the `script.ps1` file in a text editor.
    - Update the following variables with your specific paths and filenames:

        ```powershell
        # Define variables
        $repoPath = "C:\Path\To\Your\Repo"  # Path where the GitHub repository is cloned
        $savePath = "C:\Users\<YourUsername>\AppData\Local\FactoryGame\Saved\SaveGames\<YourSteamID>"
        $saveFile = "YourSaveFileName.sav"
        ```

        - Replace `C:\Path\To\Your\Repo` with the path where you cloned the repository.
        - Replace `<YourUsername>` with your Windows username.
        - Replace `<YourSteamID>` with your Steam ID (found in the save file directory).
        - Replace `YourSaveFileName.sav` with the name of your Satisfactory save file.

3. **Set Execution Policy (If Necessary)**

    To allow the script to run, you might need to adjust your PowerShell execution policy:

    ```powershell
    Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
    ```

    **Note**: Be cautious when changing execution policies and ensure you understand the implications.

4. **Configure Steam Launch Options**

    - Open Steam and navigate to your game library.
    - Right-click on **Satisfactory** and select **Properties**.
    - Under **Launch Options**, enter the following:

        ```bash
        powershell -ExecutionPolicy Bypass -File "C:\Path\To\Your\script.ps1" %command%
        ```

        - Replace `C:\Path\To\Your\script.ps1` with the actual path to your script file.

## Usage

1. **Launch the Game via Steam**

    Start Satisfactory from your Steam library as usual. The script will automatically:

    - Pull the latest save file from the GitHub repository.
    - Copy the save file to your game's save directory.
    - Launch Satisfactory.
    - Wait for the game to exit.
    - Copy the updated save file back to the repository directory.
    - Commit and push the changes to GitHub with a timestamped commit message.

2. **Collaborate with Friends**

    - Ensure all players have access to the repository and have set up the script on their machines.
    - When each player finishes their session, the updated save file will be available for others after they pull from the repository.

## Notes

-   **Conflict Handling**: Avoid playing simultaneously without coordinating, as this may lead to merge conflicts. If conflicts occur, you'll need to resolve them manually.

-   **Authentication**: Set up SSH keys or a Git credential manager to enable the script to push changes without prompting for credentials.

-   **Backup**: It's a good idea to periodically back up your save files to prevent data loss.

-   **Customization**: Feel free to modify the script to suit your needs, such as changing the commit message format or adding additional error handling.

## License

This project is licensed under the [MIT License](LICENSE).
