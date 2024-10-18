import subprocess
import sys

def tiny_days():
    subprocess.run(["python3", f"./{sys.argv[1]}}/{sys.argv[2]}/tiny.py"])

if __name__ == "__main__":
    tiny_days()
