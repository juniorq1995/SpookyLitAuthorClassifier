Identifying the Authors of Spooky Literature Based On Their Writing Style

Project Team: Junior Quintero, Thomas Hansen

Librarians all around the world have to constantly live with in fear for their
precious books. Bookworms, page-folding, humidity cause them to clutch their books
safely in their arms. But there is one danger above all that plagues them, spontaneous
mixup of the pages between different books. Luckily, there is now a hero that can save
us from this calamity: machine learning. By using Natural Language Processing in
Matlab it is possible to train a classifier to recognize the style and syntax use of certain
authors and even certain books! Now Librarians everywhere can breathe a sigh of relief
as our champion algorithm gets ready to defeat their worst fear! (This project is based
off of the Kaggle competition Spooky Author Identification )

This project rests entirely on finding a coefficient to the matrix containing the
book excerpts so that each row will correspond to a label. However, to get there we
have to process the data (with an open source Natural Language Processor ) to get it
ready for the Least Squares Classifier and choose a Lambda parameter to start off the
algorithm with. Following this, there is a great deal of fine-tuning required in order to
achieve a high accuracy with the test dataset. Once a satisfactory success rate has
been achieved the classifier will be ready to face the nightmares of librarians!

Milestones:
1. Process the dataset with a Natural Language Processor MatlabNPL
a. In Matlab, visualize the data with different plots of different scales to
understand the data
b. Examine the dataset and run small tests to determine an appropriate
starting Regularization Parameter
c. Create additional columns containing sentence properties/features
(punctuation, use of pronouns, etc.)
2. Find a solution to the matrix problem using Least Squares Multi-Class
Classification with a Regularization Parameter
a. Import the dataset and its labels and compute the missing vector using the
LSC
3. Evaluate the classifier by having it output the probability that an excerpt belongs
to a certain author
a. Increase/decrease the Regularization Parameter based on the classifiers
performance and its bias/variance
