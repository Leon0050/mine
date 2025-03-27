valid_filenames = ["filea", "fileb", "filec", "filed", "filee"]
print("CHECK FILENAMES")

filename = input("Input a filename (or quit to exit): ")
while filename != "quit":
    if filename in valid_filenames:
        print(f"{filename} - is a valid filename.")
    else:
        print(f"{filename} - *is not* a valid filename.")
    filename = input("Input a filename (or quit to exit): ")

print("GOODBYE")
