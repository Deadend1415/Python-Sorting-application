import os,shutil,sys

if len(sys.argv) < 2:
    print("Please provide a folder name")
    exit()

source = sys.argv[1]

files = []

# Collect all visible files in the source folder
print(os.listdir(source))
for f in os.listdir(source):
    path = os.path.join(source, f)  # very important!
    if os.path.isfile(path) and not f.startswith("."):  # check filename, not full path
        files.append(path)

# Process each file
for filepath in files:
    root, ext = os.path.splitext(filepath)

    if ext == "":  # skip files without extension if you want
        continue

    # Build the folder path inside the source folder
    folder_path = os.path.join(source, ext)

    os.makedirs(folder_path, exist_ok=True) # Create the folder if it doesn't exist
    # Move the file into the folder
    shutil.move(filepath, folder_path) 
    print(filepath)

