from pathlib import Path

# __file__ - dunder file:
# absolute path to "data"
DATA_PATH = (Path(__file__).parent / "data")

DATABASE_PATH = Path(__file__).parent / "goterborg_stad.db"

print(DATA_PATH)
print(DATABASE_PATH)