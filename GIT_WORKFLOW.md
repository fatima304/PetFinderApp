# Git Workflow Documentation 🔄

This document outlines the Git workflow and branching strategy used in the Pet Finder App project.

## Branch Strategy 🌳

### Main Branches

#### `main` Branch
- **Purpose**: Production-ready code
- **Protection**: Protected branch with required reviews
- **Deployment**: Automatically deploys to production
- **Merge Policy**: Only accepts PRs from `develop` branch

#### `develop` Branch
- **Purpose**: Integration branch for features
- **Protection**: Protected branch with required reviews
- **Deployment**: Deploys to staging environment
- **Merge Policy**: Accepts PRs from feature branches

#### `test_branch` Branch
- **Purpose**: Testing and validation branch
- **Protection**: No protection rules
- **Deployment**: Manual deployment for testing
- **Merge Policy**: Accepts PRs from any branch


## Tools and Commands 🛠️

### Useful Git Commands
```bash
# Create and switch to new branch
git checkout -b feature/new-feature

# Switch to existing branch
git checkout develop

# Pull latest changes
git pull origin develop

# View commit history
git log --oneline

# Stash changes
git stash
git stash pop

# Reset to previous commit
git reset --hard HEAD~1
```

#### Merge Conflicts
```bash
# Resolve conflicts manually
git status
# Edit conflicted files
git add .
git commit
