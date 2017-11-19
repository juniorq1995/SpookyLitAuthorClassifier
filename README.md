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

The dataset contains text from works of fiction written by spooky authors of the public domain: Edgar Allan Poe, HP Lovecraft and Mary Shelley. The data was prepared by chunking larger texts into sentences using CoreNLP's MaxEnt sentence tokenizer, so you may notice the odd non-sentence here and there. The objective is to accurately identify the author of the sentences in the test set.

File descriptions

train.csv - the training set
test.csv - the test set
sample_submission.csv - a sample submission file in the correct format
Data fields

id - a unique identifier for each sentence
text - some text written by one of the authors
author - the author of the sentence (EAP: Edgar Allan Poe, HPL: HP Lovecraft; MWS: Mary Wollstonecraft Shelley)

Submissions are evaluated using multi-class logarithmic loss. Each id has one true class. For each id, you must submit a predicted probability for each author. The formula is then:
logloss=−1N∑i=1N∑j=1Myijlog(pij),
where N is the number of observations in the test set, M is the number of class labels (3 classes), loglog is the natural logarithm, yijyij is 1 if observation ii belongs to class jj and 0 otherwise, and pijpij is the predicted probability that observation ii belongs to class jj.

The submitted probabilities for a given sentences are not required to sum to one because they are rescaled prior to being scored (each row is divided by the row sum). In order to avoid the extremes of the log function, predicted probabilities are replaced with max(min(p,1−10−15),10−15)max(min(p,1−10−15),10−15).
Submission File

You must submit a csv file with the id, and a probability for each of the three classes. The order of the rows does not matter. The file must have a header and should look like the following:
id,EAP,HPL,MWS
id07943,0.33,0.33,0.33
