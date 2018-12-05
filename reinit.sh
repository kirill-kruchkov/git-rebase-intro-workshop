git checkout master

# Reset everything
git branch -D clean-up
git branch -D title
git branch -D formatting
git branch -D paragraph-3
git branch -D paragraph-2
git branch -D paragraph-1
git branch -D manifesto

# Create manifesto
git checkout -b manifesto 
rm -f manifesto.md
touch manifesto.md && echo "Move fast, break things" >> manifesto.md
git add manifesto.md
git commit -m "Create manifesto"

# Clean-up branch
git checkout -b clean-up
rm -f manifesto.md && touch manifesto.md
git add manifesto.md
git commit -m "Clean-up"

# Paragraph 1
git checkout manifesto
git checkout -b paragraph-1
rm -f manifesto.md
echo "# title placeholder\n" >> manifesto.md
echo "We are uncovering better ways of developing\n" >> manifesto.md
echo "software by doing it and helping others do it.\n" >> manifesto.md
echo "Through this work we have come to value:\n" >> manifesto.md
git add manifesto.md
git commit -m "Paragraph 1"

# Merge clean-up
git checkout manifesto
git merge clean-up
git branch -D clean-up

# Paragraph-2
git checkout manifesto
git checkout -b paragraph-2 
echo "Individuals and interactions over processes and tools\n" >> manifesto.md
echo "Working software over comprehensive documentation\n" >> manifesto.md
echo "Customer collaboration over contract negotiation\n" >> manifesto.md
echo "Responding to change over following a plan\n" >> manifesto.md
git add manifesto.md
git commit -m "Paragraph 2"

# Paragraph-3
git checkout paragraph-1
git checkout -b paragraph-3
echo "That is, while there is value in the items on\n" >> manifesto.md
echo "the right, we value the items on the left more.\n" >> manifesto.md
git add manifesto.md
git commit -m "Paragraph 3"

# Formatting
git checkout paragraph-2
git checkout -b formatting

sed -i '' 's/Individuals/**Individuals/' manifesto.md
sed -i '' 's/interactions/interactions**/' manifesto.md
sed -i '' 's/Working/**Working/' manifesto.md
sed -i '' 's/software/software**/' manifesto.md
git add manifesto.md
git commit -m "Formatting 1"

sed -i '' 's/Customer/**Customer/' manifesto.md
sed -i '' 's/collaboration/collaboration**/' manifesto.md
sed -i '' 's/Responding/**Responding/' manifesto.md
sed -i '' 's/change/change**/' manifesto.md
git add manifesto.md
git commit -m "Formatting 2"

# Title
git checkout manifesto
git checkout -b title
echo "# Manifesto for Agile Software Development\n" >> manifesto.md
git add manifesto.md
git commit -m "Title"

git checkout manifesto

clear