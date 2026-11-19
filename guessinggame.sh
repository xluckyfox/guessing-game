#!/usr/bin/env bash

count_files() {
  # Only regular files in this directory count toward the answer.
  find . -maxdepth 1 -type f | wc -l
}

# Capture the answer once so it stays consistent while the game runs.
answer=$(count_files)

echo "How many regular files are in the current directory?"

while true; do
  # Keep asking until a valid, correct guess is entered.
  read -r -p "Enter your guess: " guess

  if ! [[ $guess =~ ^[0-9]+$ ]]; then
    echo "Please enter a whole number."
  elif (( guess < answer )); then
    echo "Your guess is too low. Try again."
  elif (( guess > answer )); then
    echo "Your guess is too high. Try again."
  else
    echo "Congratulations! You guessed the correct number of files."
    break
  fi
done
