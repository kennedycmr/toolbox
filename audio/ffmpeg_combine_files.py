# Python 3 code to output a list of folder files in a format
# suitable for ffmpeg to combine all files into a single
# audio file 

# Check the variables under main() to ensure the directories
# are accurate. The run the script and it will output a
# command that you need to run.
# The run that command from the same location as the source
# files.
 
# importing os module
import os
 
# Function to rename multiple files
def main():
    folder = "Source Files"  # path to source files
    outFile = "output.mp3"  # output file
    concatFiles = ""
   
    fileList = os.listdir(folder)
    fileList.sort()

    for filename in fileList:
        fParts = filename.split()
        if not filename.startswith(folder):
            continue   # skip if filename doesn't match

        if not concatFiles:
            concatFiles = f"concat:{filename}"
        else:
            concatFiles = f"{concatFiles}|{filename}"
         

    command = f"ffmpeg -i \"{concatFiles}\" -acodec copy {outFile}"
    print(command)

 
# Driver Code
if __name__ == '__main__':
     
    # Calling main() function
    main()

