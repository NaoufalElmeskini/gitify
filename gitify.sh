# Make executable with chmod +x <<filename.sh>>


# step 1: name of the remote repo. Enter a SINGLE WORD ..or...separate with hyphens
#echo "What name do you want to give your remote repo?"
#read REPO_NAME
LOCAL_DIR=${PWD##*/}          # to assign to a variable

printf '%s\n' "${PWD##*/}" # to print to stdout
                           # ...more robust than echo for unusual names
                           #    (consider a directory named -e or -n)

printf '%q\n' "${PWD##*/}" # to print to stdout, quoted for use as shell input
                           # ...useful to make hidden characters readable.

REPO_NAME=$LOCAL_DIR
echo repo_name : $REPO_NAME;

DESCRIPTION=""
echo $DESCRIPTION;

# step 2:  the local project folder path

echo "Enter your Github username:"
read USERNAME
echo "Github username: "$USERNAME

echo "Enter your Github token:"
read TOKEN
echo "TOKEN: " TOKEN

# step 4: initialise the repo locally, create blank README, add and commit
git init
touch README.MD
git add *
git commit -m 'initial commit with .sh script'


# step 5 use github API to log the user in
curl -u ${USERNAME}:${TOKEN} https://api.github.com/user/repos -d "{\"name\": \"${REPO_NAME}\", \"description\": \"${DESCRIPTION}\"}"

#  step 6 add the remote github repo to local repo and push
git remote add origin https://github.com/${USERNAME}/${REPO_NAME}.git
git push --set-upstream origin master

# step 7 change to your project's root directory.
cd "$PROJECT_PATH"

echo "Done. Go to https://github.com/$USERNAME/$REPO_NAME to see." 
echo " *** You're now in your project root. ***"
