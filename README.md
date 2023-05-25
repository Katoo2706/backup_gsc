# Analytic database backup

A brief description of the project.

## Installation

> install google-cloud-sdk

## Run
> bash start.sh

### Restore backup file
`Restore last file pushed to GSC in log.txt`

> bash backup/restore.sh

### Execution method
- Create .env file with environment variable
- Login GSC serivce with authorization
- Run backup
- Backup file saved in **backup/log.txt**

### Tree
```
.
├── README.md
├── backup
│   ├── backup.sh
│   ├── .env
│   └── temp/
└── start.sh
```
