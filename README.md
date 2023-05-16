<br />
  <h1 align="center">Assignment 1: Linguistic Analysis using NLP</h1> 
  <h2 align="center">Cultural Data Science, 2023</h2> 
  <h3 align="center">
  Author: Aleksander Moeslund Wael <br>
  Student no. 202005192
  </h3>
</p>

## Assignment notes (Ross)

This assignment is about using ```scikit-learn``` to train simple (binary) classification models on text data. For this assignment, we'll continue to use the Fake News Dataset that we've been working on in class.

For this exercise, you should write *two different scripts*. One script should train a logistic regression classifier on the data; the second script should train a neural network on the same dataset. Both scripts should do the following:

- Be executed from the command line
- Save the classification report to the folder called ```out```
- Save the trained models and vectorizers to the folder called ```models```
---

## About the project
This repo contains a collection of Python scripts for preprocessing, training and predicting classes of text data. There are three scripts involved in this process, all located in the `src` folder; `vectorizer.py`, which is the script for preprocessing and extracting features from the text data using tf-idf. Then there are two classification scripts, `logistic_regression.py` and `neural_network.py`, each using either logistic regression or a MLP classifier for binary classification and then saving a classification report for analysis or other use.

### Data
The text data used for this project is the Fake News Dataset. It consists of 10556 news articles, each containing a title, article text and label. All articles are either real or fake news, and the task is to predict the true label of articles based on the article text.

### Pipeline
The ``vectorizer.py`` script is run first to extract features. The script follows these steps:
1. Import dependencies
2. Load data located in `in` folder
3. Intitialize vectorizer
4. Vectorize data using tf-idf
5. Save the vectorizer in the `models` folder
5. Save the preprocessed data in the `in` folder

The `logistic_regression.py` and `neural_network.py` scripts follow these steps:
1. Import dependencies
2. Load preprocessed data from the `vectorizer.py` script
3. Initialize the model (logistic regression or MLP classifier)
4. Fit the model to the data
5. Use model to predict labels
6. Save the model to the `models` folder
7. Save a classification report to the `out` folder

## Requirements

The code is tested on Python 3.11.2. Futhermore, if your OS is not UNIX-based, a bash-compatible terminal is required for running shell scripts (such as Git for Windows).

## Usage

The repo was setup to work with Windows (the WIN_ files), MacOS and Linux (the MACL_ files).

### 1. Clone repository to desired directory

```bash
git clone https://github.com/alekswael/assignment-2---text-classification
cd assignment-2---text-classification-alekswael
```
### 2. Run setup script 
**NOTE:** Depending on your OS, run either `WIN_setup.sh` or `MACL_setup.sh`.

The setup script does the following:
1. Creates a virtual environment for the project
2. Activates the virtual environment
3. Installs the correct versions of the packages required
5. Deactivates the virtual environment

```bash
bash WIN_setup.sh
```

### 3. Run pipeline
**NOTE:** Depending on your OS, run either `WIN_run.sh` or `MACL_run.sh`.

**OBS: Make sure to run the vectorizer script first!**

The script does the following:
1. Activates the virtual environment
2. Runs `vectorizer.py` located in the `src` folder
3. Deactivates the virtual environment

```bash
bash WIN_run_vectorizer.sh
```

Then, you can run either the `*nn.sh` or `*lr.sh` script.

The scripts do the following:
1. Activates the virtual environment
2. Runs `logistic_regression.py` or `neural_network.py` located in the `src` folder
3. Deactivates the virtual environment

```bash
bash WIN_run_lr.sh
bash WIN_run_nn.sh
```

## Note on model tweaks
Some model parameters can be set through the ``argparse`` module. However, this requires running the Python script seperately OR altering the `run*.sh` file to include the arguments. The Python script is located in the `src` folder. Make sure to activate the environment before running the Python script.

```
vectorizer.py [-h] [--data DATA] [--out OUT] [--text TEXT] [--label LABEL] [--test_size TEST_SIZE] [--ngram_range NGRAM_RANGE] [--lowercase LOWERCASE] [--max_df MAX_DF] [--min_df MIN_DF] [--max_features MAX_FEATURES]

options:
  -h, --help            show this help message and exit
  --data DATA           Name of data file, should be a .csv (default: fake_or_real_news.csv)
  --out OUT             Folder where vectorizer is saved (default: models)
  --text TEXT           Name of text (X) column in data file (default: text)
  --label LABEL         Name of label (y) column in data file (default: label)
  --test_size TEST_SIZE
                        Size of test split, int between 0-1. (default: 0.2)
  --ngram_range NGRAM_RANGE
                        Ngram range for vectorizer, two digits seperated by a comma. NB: NO SPACES ALLOWED (default: 1,2)
  --lowercase LOWERCASE
                        If the data should be transformed to lowercase (default: True)
  --max_df MAX_DF       Specify max_df parameter (default: 0.95)
  --min_df MIN_DF       Specify min_df parameter (default: 0.05)
  --max_features MAX_FEATURES
                        Specify max number of features for vectorizer (default: 500)
```

```
neural_network.py [-h] [--nodes_layers NODES_LAYERS] [--max_iter MAX_ITER]

options:
  -h, --help            show this help message and exit
  --nodes_layers NODES_LAYERS
                        Number of nodes per layer. Default is one layer of 5 nodes. For one layer, do not include comma at end! NB: NO SPACES ALLOWED (default: 5)
  --max_iter MAX_ITER   Number of iterations. Default is 1000. (default: 1000)
```

## Repository structure
This repository has the following structure:
```
│   .gitignore
│   MACL_run_lr.sh
│   MACL_run_nn.sh
│   MACL_run_vectorizer.sh
│   MACL_setup.sh
│   README.md
│   requirements.txt
│   WIN_run_lr.sh
│   WIN_run_nn.sh
│   WIN_run_vectorizer.sh
│   WIN_setup.sh
│   
├───.github
│       .keep
│       
├───in
│       fake_or_real_news.csv
│       
├───models
│       .gitkeep
│       
├───out
│       .gitkeep
│
├───src
│       .gitkeep
│       logistic_regression.py
│       neural_network.py
│       vectorizer.py
│
└───__pycache__
```

## Report on findings

As seen by the classification reports below, the two methods obtain very similar performance at 89% accuracy. In such a case, it is useful to pick the least compute-intensive model for the task.

```
Classification report for logistic regression

              precision    recall  f1-score   support

        FAKE       0.89      0.88      0.88       628
        REAL       0.88      0.90      0.89       639

    accuracy                           0.89      1267
   macro avg       0.89      0.89      0.89      1267
weighted avg       0.89      0.89      0.89      1267
```
```
Classification report for neural network

              precision    recall  f1-score   support

        FAKE       0.91      0.87      0.89       628
        REAL       0.88      0.91      0.90       639

    accuracy                           0.89      1267
   macro avg       0.89      0.89      0.89      1267
weighted avg       0.89      0.89      0.89      1267
```

