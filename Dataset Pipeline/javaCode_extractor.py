import os
import requests
from urllib.parse import urlparse, unquote
from dotenv import load_dotenv

# ================= ENV =================
load_dotenv()
GITHUB_TOKEN = os.getenv("GITHUB_TOKEN")

if not GITHUB_TOKEN:
    print("❌ GITHUB_TOKEN not found. Check .env file.")
    exit(1)

HEADERS = {
    "Accept": "application/vnd.github.v3+json",
    "Authorization": f"token {GITHUB_TOKEN}"
}

# ================= CONFIG =================
OUTPUT_DIR = "Java_files"
os.makedirs(OUTPUT_DIR, exist_ok=True)

# REPO_URLS = [
#     "https://github.com/akshayavb99/CodingNinjas_Java_DSA/tree/master/Course%201%20-%20Introduction%20to%20JAVA/Lecture%206%20-%20Patterns%202",
#     "https://github.com/akshayavb99/CodingNinjas_Java_DSA/tree/master/Course%201%20-%20Introduction%20to%20JAVA",
#     "https://github.com/akshayavb99/CodingNinjas_Java_DSA/tree/master/Course%201%20-%20Introduction%20to%20JAVA/Lecture%207%20-%20Operators%20and%20For%20Loop",
#     "https://github.com/akshayavb99/CodingNinjas_Java_DSA/tree/master/Course%201%20-%20Introduction%20to%20JAVA/Lecture%209%20-%20Arrays%201",
#     "https://github.com/akshayavb99/CodingNinjas_Java_DSA/tree/master/Course%201%20-%20Introduction%20to%20JAVA/Test-1",

#     "https://github.com/thatbeautifuldream/java-dsa-bootcamp/tree/main/02-first-java",
#     "https://github.com/thatbeautifuldream/java-dsa-bootcamp/tree/main/03-conditionals-loops",

#     "https://github.com/kumasumit/CodingNinjas_Java_DSA_Premium/tree/main/Introduction%20to%20Java/Course%20Test%201",
#     "https://github.com/kumasumit/CodingNinjas_Java_DSA_Premium/tree/main/Introduction%20to%20Java/Lecture%202%2C%20Getting%20Started%20with%20Java",
#     "https://github.com/kumasumit/CodingNinjas_Java_DSA_Premium/tree/main/Introduction%20to%20Java/Lecture%204%2C%20Conditionals%20and%20Loops",
#     "https://github.com/kumasumit/CodingNinjas_Java_DSA_Premium/tree/main/Introduction%20to%20Java/Lecture%205%2C%20Patterns%201",
#     "https://github.com/kumasumit/CodingNinjas_Java_DSA_Premium/tree/main/Introduction%20to%20Java/Lecture%207%2C%20Operators%20and%20For%20Loop",
#     "https://github.com/kumasumit/CodingNinjas_Java_DSA_Premium/tree/main/Introduction%20to%20Java/Lecure%206%2C%20Patterns%202",
#     "https://github.com/kumasumit/CodingNinjas_Java_DSA_Premium/tree/main/Introduction%20to%20Java/Test%201",
#     "https://github.com/kumasumit/CodingNinjas_Java_DSA_Premium/tree/main/Introduction%20to%20Java/Test%202",
#     "https://github.com/kumasumit/CodingNinjas_Java_DSA_Premium/tree/main/Introduction%20to%20Java/Test%203",
#     "https://github.com/kumasumit/CodingNinjas_Java_DSA_Premium/tree/main/Introduction%20to%20Java/Lecture%208%2C%20Functions%20and%20Scope",

#     "https://github.com/kishanrajput23/Java-DSA-Bootcamp/tree/main/Lectures/05-first-java-program/Codes",
#     "https://github.com/kishanrajput23/Java-DSA-Bootcamp/tree/main/Lectures/06-conditions-loops/Conditionals%20Codes",
#     "https://github.com/kishanrajput23/Java-DSA-Bootcamp/tree/main/Lectures/06-conditions-loops/Switch%20Codes",
#     "https://github.com/kishanrajput23/Java-DSA-Bootcamp/tree/main/Lectures/08-arrays",

#     "https://github.com/Bharat2044/Striver-A2Z-DSA-Sheet-Solution-using-JAVA/tree/main/Step%2001%20%3A%20Learn%20the%20basics/Lec%204%3A%20Know%20Basic%20Maths"
# ]

REPO_URLS = [
    "https://github.com/jsquared21/Intro-to-Java-Programming/tree/master/Exercise_01",
    "https://github.com/jsquared21/Intro-to-Java-Programming/tree/master/Exercise_02",
    "https://github.com/jsquared21/Intro-to-Java-Programming/tree/master/Exercise_03",
    "https://github.com/jsquared21/Intro-to-Java-Programming/tree/master/Exercise_04",
    "https://github.com/jsquared21/Intro-to-Java-Programming/tree/master/Exercise_05"
]


# ================= HELPERS =================

def parse_github_url(url):
    url = unquote(url)
    parts = urlparse(url).path.strip("/").split("/")

    user, repo = parts[0], parts[1]

    if "blob" in parts:
        i = parts.index("blob")
        branch = parts[i + 1]
        path = "/".join(parts[i + 2:])
        return user, repo, branch, path, "file"

    if "tree" in parts:
        i = parts.index("tree")
        branch = parts[i + 1]
        path = "/".join(parts[i + 2:])
        return user, repo, branch, path, "dir"

    return None


def github_api_list(user, repo, path, branch):
    api_url = f"https://api.github.com/repos/{user}/{repo}/contents/{path}?ref={branch}"
    r = requests.get(api_url, headers=HEADERS)
    if r.status_code != 200:
        print("❌ Failed:", api_url)
        return []
    return r.json()


def download_file(url, save_path):
    r = requests.get(url, headers=HEADERS)
    if r.status_code == 200:
        with open(save_path, "wb") as f:
            f.write(r.content)


def process_dir(user, repo, branch, path):
    items = github_api_list(user, repo, path, branch)

    for item in items:
        if item["type"] == "file" and item["name"].endswith(".java"):
            fname = f"{repo}_{item['name']}"
            save_path = os.path.join(OUTPUT_DIR, fname)
            download_file(item["download_url"], save_path)
            print("✅ Saved:", fname)

        elif item["type"] == "dir":
            process_dir(user, repo, branch, item["path"])


# ================= MAIN =================

for url in REPO_URLS:
    print("\nExtracting from:", url)
    parsed = parse_github_url(url)

    if not parsed:
        print("❌ Invalid URL")
        continue

    user, repo, branch, path, kind = parsed

    if kind == "file":
        file_info = github_api_list(user, repo, path, branch)
        if isinstance(file_info, dict) and file_info["name"].endswith(".java"):
            fname = f"{repo}_{file_info['name']}"
            save_path = os.path.join(OUTPUT_DIR, fname)
            download_file(file_info["download_url"], save_path)
            print("✅ Saved:", fname)
    else:
        process_dir(user, repo, branch, path)

print("\n🎯 Done. All Java files saved in:", OUTPUT_DIR)
