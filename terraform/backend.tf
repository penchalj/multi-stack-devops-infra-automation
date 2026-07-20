terraform {
  backend "s3" {
    bucket         = "penchalj-devops-voting-tfstate"
    key            = "voting-app/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    
    # ✅ Use this for modern native S3 locking (recommended)
    use_lockfile   = true
    
    # ❌ Remove or comment out the old deprecated line
    # dynamodb_table = "penchalj-voting-tf-lock"
  }
}