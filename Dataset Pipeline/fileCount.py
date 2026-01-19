import os

folder = "./COBOL_files"  # folder you want to check
folder1 = "./Java_files"
num_files = len([f for f in os.listdir(folder) if os.path.isfile(os.path.join(folder, f))])
num_files1 = len([f for f in os.listdir(folder1) if os.path.isfile(os.path.join(folder1, f))])
print(f"Number of files in {folder}: {num_files}")
print(f"Number of files in {folder1}: {num_files1}")