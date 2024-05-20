require "csv"

memo_type = nil

loop do
    puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"
    input = gets.to_i
    if input == 1 || input == 2
        memo_type = input
        break
    else
        puts "無効な入力です。1か2を入力して下さい"
    end
end

# 1が押された場合
if memo_type == 1
    puts "拡張子を除いたファイルを入力して下さい"
    file_name = gets.chomp + ".csv"

    puts "メモしたい内容を記入して下さい"
    puts "完了したら、Ctrl + Dをおします"
    memo_body = $stdin.read

    CSV.open(file_name,"w") do |csv|
        memo_body.split("\n").each do |line|
             csv << [line]  
        end  
end

# 2が押された場合
elsif memo_type == 2
    puts "編集するファイルを拡張子を除いて入力して下さい"
    file_name = gets.chomp + ".csv"

    if File.exist?(file_name)
        csv_content = CSV.read(file_name)
        csv_content.each do |row|
            puts row[0]
        end
        puts "追加したい内容を記入して下さい"
        puts "完了したら、Ctrl + Dをおします"
        memo_body =$stdin.read

        CSV.open(file_name,"a") do |csv|
            memo_body.split("\n").each do |line|
                 csv << [line]  
            end  
    end
end

else
    puts "ファイルが見つかりませんでした"
end

