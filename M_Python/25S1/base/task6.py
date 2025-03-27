# 定义每个部门的有效文件以及对应的密码（如果没有密码则为 None）
valid_files_by_dept = {
    "dep1": {"filea": None, "fileb": "pass1"},
    "dep2": {"filec": None, "filed": "pass2"},
    "dep3": {"filea": None, "filec": None}
}

print("CHECK FILENAMES")

while True:
    department = input("Input a department (or quit to exit): ")
    if department == "quit":
        break
    # 如果输入的部门不在字典中，则直接重新询问部门
    if department not in valid_files_by_dept:
        continue

    # 要求输入非空的文件名
    filename = ""
    while filename == "":
        filename = input("Input a filename: ")

    # 检查该文件名是否在该部门的有效文件中
    if filename in valid_files_by_dept[department]:
        # 获取该文件是否需要密码
        file_password = valid_files_by_dept[department][filename]
        if file_password is not None:
            attempts = 3
            correct = False
            while attempts > 0:
                print(f"{attempts} password attempts remain.")
                user_pass = input("Input password: ")
                if user_pass == file_password:
                    correct = True
                    break
                attempts -= 1
            # 如果三次尝试均失败，则返回部门输入界面
            if not correct:
                continue
        # 如果文件不需要密码或密码验证成功，打印有效信息
        print(f"{filename} - is a valid filename for - {department}")
    else:
        print(f"{filename} - *is not* a valid filename for - {department}")

print("GOODBYE")