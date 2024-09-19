import os

def get_file_name_and_extension(file_name):
    # Split the file name and extension
    name, extension = os.path.splitext(file_name)
    return name, extension

def rename_file(directory, old_name, new_name):
    old_path = os.path.join(directory, old_name)
    new_path = os.path.join(directory, new_name)
    try:
        os.rename(old_path, new_path)
        print(f"Renamed '{old_name}' to '{new_name}'")
    except Exception as e:
        print(f"Error renaming file '{old_name}': {e}")

# Get directory path from user
directory = input("Enter the directory path: ")

# List all files in the directory
try:
    for filename in os.listdir(directory):
        # Check if it's a file (not a directory)
        if os.path.isfile(os.path.join(directory, filename)):
            # Print the file name and extension
            name, extension = get_file_name_and_extension(filename)
            print(f"File name: {name}, Extension: {extension}")

            # Further split the name using underscore
            name_parts = name.split('_')
            # Find the length of name_parts
            length = len(name_parts)
            print(f"File name parts: {name_parts}, Length: {length}, Extension: {extension}")

            # Create the new file name
            new_filename = f"{name}_renamed{extension}"
            # Rename the file
            rename_file(directory, filename, new_filename)

            print(f"File name: {name}, Extension: {extension}")
except Exception as e:
    print(f"Error accessing directory '{directory}': {e}")
