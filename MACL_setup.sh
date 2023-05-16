# Create a virtual environment
python3 -m venv news_classification_venv

# Activate the virtual environment
source ./news_classification_venv/bin/activate

# Install requirements
python3 -m pip install --upgrade pip
python3 -m pip install -r ./requirements.txt

# deactivate
deactivate

#rm -rf news_classification_venv