echo "パスワードマネージャーへようこそ！"

while true; do
        echo "次の選択肢から入力してください(Add Password/Get Password/Exit):"

        read action

        if [[ $action == "Add Password" ]]; then
                echo "サービス名を入力してください："
                read service

                echo "ユーザー名を入力してください："
                read user

                echo "パスワードを入力してください："
                read password

                echo "$service:$user:$password" >> passlist.txt

                echo "パスワードの追加は成功しました"
                continue

        elif [[ $action == "Get Password" ]]; then
                echo "サービス名を入力してください："
                                read servicein
                                result=$(grep "$servicein" passlist.txt)
                                if [ -n "$result" ]; then

                                        userout=$(echo "$result" | sed 's/^[^:]*:\(.*\):[^:]*/\1/')
                                        passout=$(echo "$result" | sed 's/^[^:]*:[^:]*:\(.*\)/\1/')

                                        echo "サービス名：$servicein"
                                        echo "ユーザー名：$userout"
                                        echo "パスワード：$passout"
                                        continue
                                else
                                        echo "そのサービスは登録されていません。"
                                        continue
                                fi
        elif [[ $action == "Exit" ]]; then
                echo "Thank you!"
                break
        else
                echo "入力が間違えています。Add Password/Get Password/Exit から入力してください"
                continue
        fi
done