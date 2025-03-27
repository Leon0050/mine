valid_files_by_dept = {
    "dep1": ["filea", "fileb"],
    "dep2": ["filec"],
    "dep3": ["filea", "filec"]
}

print("CHECK FILENAMES")

department = input("Input a department (or quit to exit): ").strip()
while department != "quit":
    if department in valid_files_by_dept:
        filename = input("Input a filename: ").strip()
        while filename == "":
            filename = input("Input a filename: ").strip()

        if filename in valid_files_by_dept[department]:
            print(f"{filename} - is a valid filename for - {department}")
        else:
            print(f"{filename} - *is not* a valid filename for - {department}")

    department = input("Input a department (or quit to exit): ").strip()  # use strip to check the blackt user input

print("GOODBYE")