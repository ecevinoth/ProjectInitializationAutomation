import sys
import os
from github import Github

def create():
    username = sys.argv[1]  # Insert your github username here
    password = sys.argv[2]  # Insert your github password here
    folderName = str(sys.argv[3])
    path = sys.argv[4]
    private_bool = True if sys.argv[5] == 'private' else False
    os.makedirs(path + "/" + str(folderName))
    user = Github(username, password).get_user()
    repo = user.create_repo(folderName, private=private_bool)
    print(f"Succesfully created repository {folderName}")

if __name__ == "__main__":
    create()
