import os
import re

def replace_footer_content(directory):
    # 新的footer内容
    new_footer_content = '''
    <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-1331971422311386"
        crossorigin="anonymous"></script>
    '''

    # 确保目录路径末尾有斜杠
    if not directory.endswith('/'):
        directory += '/'
    
    # 遍历目录下的所有html文件
    for filename in os.listdir(directory):
        if filename.endswith('.html'):
            file_path = directory + filename
            
            try:
                # 读取文件内容
                with open(file_path, 'r', encoding='utf-8') as file:
                    content = file.read()
                
                # 使用正则表达式在head标签末尾添加内容
                new_content = re.sub(
                    r'(</head>)',
                    new_footer_content + r'\1',
                    content
                )
                
                # 写回文件
                with open(file_path, 'w', encoding='utf-8') as file:
                    file.write(new_content)
                
                print(f'Successfully processed: {filename}')
            except Exception as e:
                print(f'Error processing {filename}: {str(e)}')

# 使用示例
replace_footer_content('games')
