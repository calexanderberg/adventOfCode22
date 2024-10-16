
import subprocess
import sys

def run_tiny_script():
    subprocess.run(["python3", f"./{sys.argv[1]}/tiny.py"])

if __name__ == "__main__":
    run_tiny_script()

