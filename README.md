# voCab
単語帳アプリケーションです


## スタートガイド
アプリケーションURL
https://vo-cab.herokuapp.com/

https://vo-cab.herokuapp.com/users/sign_up<br>
にアクセスし、アカウントを作成してください

#### 単語帳の作成方法
1. 右上の新規作成ボタンをクリックしてください
[![Image from Gyazo](https://i.gyazo.com/0b9dbb2151ffda0d94ff39a253a00d2e.png)](https://gyazo.com/0b9dbb2151ffda0d94ff39a253a00d2e)
2. 単語帳作成画面に移動します、タイトルを入力してください
3. 単語帳を他者に公開したくない場合は非公開にチェックしてください(後で変更可能)
[![Image from Gyazo](https://i.gyazo.com/a1fed175c05067c8f3706d5b865427cf.gif)](https://gyazo.com/a1fed175c05067c8f3706d5b865427cf)
4. 単語帳登録が終わると単語カード登録画面に遷移します
5. 表に表示される単語、裏に表示される単語を入力してください
[![Image from Gyazo](https://i.gyazo.com/5ba3aa0be01d313b10fc099aa7b89b36.gif)](https://gyazo.com/5ba3aa0be01d313b10fc099aa7b89b36)
6. 単語帳の完成です、右上マイページをクリックして作成した単語帳を確認しましょう

#### 単語帳での勉強の仕方
1. 興味ある単語帳をクリックしてください
2. 単語カードをクリックすると裏表が入れ替わります
3. 右矢印左矢印で単語帳を入れ替えます
[![Image from Gyazo](https://i.gyazo.com/a5d99e97e3e2e4723523db8c5f566a92.gif)](https://gyazo.com/a5d99e97e3e2e4723523db8c5f566a92)

#### お気に入り機能
1. 気になる単語帳をお気に入りすることができます
2. 単語帳左上のブックマークアイコンをクリックしてください
3. お気に入り登録した単語帳がマイページ右側に表示されます
[![Image from Gyazo](https://i.gyazo.com/655fe2b101cf02902b9745232b703231.gif)](https://gyazo.com/655fe2b101cf02902b9745232b703231)

#### テストを受験する
1. ペンのアイコンがある単語帳はテストが作成されています
[![Image from Gyazo](https://i.gyazo.com/1a1409486f2de1897efb05482269c1d0.png)](https://gyazo.com/1a1409486f2de1897efb05482269c1d0)
2. ペンのアイコンをクリックするとテストを受験可能です
3. 左上に単語帳の表が表示されますので、裏の言葉を選択してください
[![Image from Gyazo](https://i.gyazo.com/b2b5153932dfddf8f3d01b5fc605ddcf.gif)](https://gyazo.com/b2b5153932dfddf8f3d01b5fc605ddcf)
4. すべてのラジオボタンをクリックしたあとに、解答をクリックします
5. テスト結果とこれまでのテスト結果のグラフが出力されます
[![Image from Gyazo](https://i.gyazo.com/58c16a7170a8728a0b7ff2fba07e1bf2.gif)](https://gyazo.com/58c16a7170a8728a0b7ff2fba07e1bf2)

### 必要条件
chromeの最新版をご利用ください
スマホからの閲覧は見た目が崩れる恐れがあります（現在対応中）

＊local環境で利用する場合はRuby2.5.1,Rails5.2,Bundler 2.0.2の導入が必要です

### local環境へのインストール

```cmd
$ cd 任意のディレクトリに移動
$ git clone https://github.com/JUN1113-program/vocab.git
$ cd vocab/
$ bundle install
$ bundle exec rake db:migrate
$ bundle exec rails s
```

その後chromeにて
http://localhost:3000/ にアクセスします

## テストの実行
```cmd
$ bundle exec rspec
```