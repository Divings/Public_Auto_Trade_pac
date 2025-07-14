import os
import re

def get_fx_debug_log(
    last_temp_path="/opt/Innovations/System/last_temp/last_temp.txt",
    target_filename="fx_debug_log.txt"
):
    # ファイル存在確認
    if not os.path.exists(last_temp_path):
        print(f"[エラー] 記録ファイルが存在しません: {last_temp_path}")
        print("権限不足の可能性があります。sudoを付けてやり直してください")
        return

    try:
        with open(last_temp_path, "r") as f:
            content = f.read()

        # /tmp/で始まる一時パスを抽出
        match = re.search(r'(/tmp/[^\s]+)', content)
        if not match:
            print("[エラー] 一時ディレクトリのパスが見つかりませんでした。")
            return

        temp_dir = match.group(1)
        log_path = os.path.join(temp_dir, target_filename)

        # 対象ファイルの存在チェック
        if not os.path.isfile(log_path):
            print(f"[エラー] ログファイルが見つかりません: {log_path}")
            print("権限不足の可能性があります。\nsudoを付けてやり直してください")
            return

        # ログファイルの表示
        print(f"[情報] ログファイル: {log_path}")
        with open(log_path, "r") as log_file:
            print(log_file.read())

    except Exception as e:
        print(f"[例外エラー] {e}")

# 実行
get_fx_debug_log()

