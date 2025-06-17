import os
import shutil
import hashlib

skip = ["auto.py", ".git"]

try:
    with open(".gitignore") as file:
        for line in file:
            skip += line
except Exception:
    print("No .gitignore")

try:
    with open(".ignore") as file:
        for line in file:
            skip += line
except Exception:
    noop = None

manifest = {}

for name in os.listdir():
    if name in skip:
        continue
    try:
        with open(name) as file:
            for line in file:
                if "@location" in line:
                    location = line.split("@location ")
                    location = location[-1]
                    location = location.split(" ")[0]
                    location = os.path.expandvars(location)
                    print(f"Copying {name} -> {location}")
                    shutil.copy(name, location)
                    continue
    except Exception as e:
        print(f"Could process {name}: {e}")
