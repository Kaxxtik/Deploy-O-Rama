#!/bin/bash

# Variables
USERNAME="your_github_username"
REPO="your_repo_name"
START_DATE="2024-04-20"
END_DATE="2024-07-26"

# Convert dates to Unix timestamps
START_TIMESTAMP=$(date -d "$START_DATE" +%s)
END_TIMESTAMP=$(date -d "$END_DATE" +%s)

# Loop through dates and create commits
current_date="$START_DATE"
while [ $(date -d "$current_date" +%s) -le $END_TIMESTAMP ]; do
    # Generate a random number of commits (between 20 and 40)
    num_commits=$((RANDOM % 21 + 20))

    for ((i = 0; i < num_commits; i++)); do
        echo "Making commit on $current_date"
        echo "Commit for date $current_date" >> dummy_file.txt
        git add dummy_file.txt
        git commit --date="$current_date 12:00:00" -m "Random commit message"

        # Sleep to ensure commit times are distinct
        sleep 1
    done

    # Move to the next day
    current_date=$(date -d "$current_date + 1 day" +%Y-%m-%d)
done

# Push changes to GitHub
git push origin main
