require 'rails_helper'

describe 'タスク管理機能', type: :system do
  describe '一覧表示機能' do
    let(:user_a) { FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com') }
    let(:user_b) { FactoryBot.create(:user, name: 'ユーザーB', email: 'b@example.com') }
    let!(:task_a) { FactoryBot.create(:task, name: '最初のタスク', user: user_a)}

    before do
      # ユーザAを作成しておく. :userファクトリを指定。,今後のため、引数に追加して他ユーザ追加対応できるようにする。passwordはファクトリ側で定義されている。
      # user_a = FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com')

      # ユーザー?でログインする
      visit login_path  # ログイン画面へアクセス
      fill_in 'メールアドレス', with: login_user.email #  メールアドレスを入力
      fill_in 'パスワード', with: login_user.password # パスワードを入力
      click_button 'ログインする' # ログインボタンをクリック
    end

    # 2箇所で使われているので共通化
    shared_examples_for 'ユーザーAが作成したタスクが表示される' do
      it { expect(page).to have_content '最初のタスク' } # 最初のタスクという内容がpage(画面)にあることを期待する。
    end

    describe '一覧表示機能' do
      context 'ユーザAがログインしているとき' do
        # before do
        # end
        # ユーザーAでログインする
        let(:login_user) { user_a }

        it_behaves_like 'ユーザーAが作成したタスクが表示される'
        # it 'ユーザーAが作成したタスクが表示される' do
        #   # 作成済みのタスクの名称が画面上に表示されていることを確認
        # end
      end

      context 'ユーザBがログインしているとき' do
        # ユーザーBを作成しておく
        let(:login_user) { user_b }

        it 'ユーザーAが作成したタスクが表示されない' do
          # ユーザーAが作成したタスクの名称が画面上に表示されてないことを確認
          expect(page).to have_no_content '最初のタスク'
          #expect(page).not_to have_content '最初のタスク' でも同じ
        end
      end

      describe '詳細表示機能' do
        context 'ユーザーAがログインしているとき' do
          let(:login_user) { user_a }

          before do
            visit task_path(task_a)
          end

          it_behaves_like 'ユーザーAが作成したタスクが表示される'

          # it 'ユーザーAが作成したタスクが表示される' do
          # end
        end
      end

      describe '新規作成機能' do
        let(:login_user) { user_a }

        before do
          visit new_task_path
          fill_in '名称', with: task_name
          click_button '登録する'
        end

        context '新規作成画面で名称を入力したとき' do
          let(:task_name) { '新規作成のテストを書く' }

          it '正常に登録される' do
            # CSSクラスも確認
            expect(page).to have_selector '.alert-success', text: '新規作成のテストを書く'
          end
        end

        context '新規作成画面で名称を入力しなかったとき' do
          let(:task_name) { '' }

          it 'エラーとなる' do
            # id要素error_explanationを確認
            within '#error_explanation' do
              expect(page).to have_content '名称を入力してください'
            end
          end
        end
      end
    end
  end
end
