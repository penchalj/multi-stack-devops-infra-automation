git init
echo "*.tfstate*" >> .gitignore
echo ".terraform/" >> .gitignore
git add .
git commit -m "Initial Terraform structure for Multi-Stack Voting App"