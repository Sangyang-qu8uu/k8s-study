import os

def generate_tree_structure(startpath):
    def tree(dir_path, level=0, prefix=""):
        files = []
        dirs = []
        for entry in os.listdir(dir_path):
            full_path = os.path.join(dir_path, entry)
            if os.path.isdir(full_path):
                dirs.append(entry)
            else:
                files.append(entry)

        for i, directory in enumerate(dirs):
            is_last = (i == len(dirs) - 1) and (len(files) == 0)
            print(f"{prefix}{'└── ' if is_last else '├── '}{directory}")
            new_prefix = f"{prefix}{'    ' if is_last else '│   '}"
            tree(os.path.join(dir_path, directory), level + 1, new_prefix)
        
        for i, file in enumerate(files):
            is_last = (i == len(files) - 1)
            print(f"{prefix}{'└── ' if is_last else '├── '}{file}")

    print(os.path.basename(startpath) + '/')
    tree(startpath)

# 使用方法
startpath = 'H:/k8s-study'  # 替换为你要生成树形结构的文件夹路径
generate_tree_structure(startpath)
