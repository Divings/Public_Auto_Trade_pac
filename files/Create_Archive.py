import pyminizip
import os
import sys
import getpass

script_path = os.path.abspath(sys.argv[0])
script_dir = os.path.dirname(script_path)

os.chdir(script_dir)

if os.path.exists('IV-AutoTrade.zip'):
    os.remove('IV-AutoTrade.zip')
    print(" 既存のIV-AutoTrade.zipを削除しました。")
print("")
print(" 現在の作業ディレクトリ:", os.getcwd())

def zip_with_password(input_dir, output_zip, password):
    files = []
    relative_paths = []

    base_name = os.path.basename(input_dir)  # ← installer

    for root, dirs, filenames in os.walk(input_dir):
        for filename in filenames:
            full_path = os.path.join(root, filename)

            # installerを含めた相対パスにする
            rel_path = os.path.relpath(root, os.path.dirname(input_dir))
            
            files.append(full_path)
            relative_paths.append(rel_path)

    pyminizip.compress_multiple(
        files,
        relative_paths,
        output_zip,
        password,
        5
    )
    
password = getpass.getpass(" パスワードを入力してください >> ")

# 使い方
zip_with_password('installer', './IV-AutoTrade.zip', password)