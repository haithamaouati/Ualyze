# Ualyze
A fast user-agent analyze that detects Browser, OS, Device Type and other attributes from user-agent

```
  _   _           _                      
 | | | |   __ _  | |  _   _   ____   ___ 
 | | | |  / _` | | | | | | | |_  /  / _ \
 | |_| | | (_| | | | | |_| |  / /  |  __/
  \___/   \__,_| |_|  \__, | /___|  \___|
                      |___/             
```

## Install

To use the Ualyze script, follow these steps:

1. Clone the repository:

    ```
    git clone https://github.com/haithamaouati/Ualyze.git
    ```

2. Change to the Ualyze directory:

    ```
    cd Ualyze
    ```
    
3. Change the file modes
    ```
    chmod +x ualyze.sh
    ```
    
5. Run the script:

    ```
    ./ualyze.sh
    ```

## Usage
Usage: `./ualyze.sh -u <user-agent>`

##### Options:

`-u`, `--ua` <user-agent>   Specify a user-agent string to analyze

`-h`, `--help`    Show this help message

## Dependencies

The script requires the following dependencies:

- [figlet](http://www.figlet.org/): `pkg install figlet - y`
- [curl](https://curl.se/): `pkg install curl - y`
- [jq](https://jqlang.org/): `pkg install jq -y`

Make sure to install these dependencies before running the script.

## Author

Made with :coffee: by **Haitham Aouati**
  - GitHub: [github.com/haithamaouati](https://github.com/haithamaouati)

## License

Ualyze is licensed under [Unlicense license](LICENSE)
