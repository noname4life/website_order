# website_order

This project involves creating a fullstack service which accept sales orders from customers

Required Installations:
1) [Miniconda](https://docs.conda.io/en/latest/miniconda.html) for Python Environments
2) [Windows Subsystem for Linux](https://www.ceos3c.com/wsl-2/install-wsl2-with-windows-terminal/)
3) [Docker Desktop](https://www.docker.com/products/docker-desktop/)


# Starting the Required Data Stores:
1) Go to the `\backend` directory
2) Run the command: `docker-compose up -d`
3) To close the initialized data stores, run the command: `docker-compose down`


# Starting the Fullstack Service:
1) In the `\backend` directory, run the command: `python main.py`
2) In another terminal, go to the `\frontend` directory then run the command: `python main.py`
