FROM python:3.11-slim

# 设置工作目录
WORKDIR /app

# 更新 pip、setuptools 和 wheel
RUN python -m pip install --upgrade pip setuptools wheel

# 复制依赖文件
COPY requirements.txt .

# 安装依赖
RUN pip install --no-cache-dir -r requirements.txt

# 复制项目代码
COPY . .

# 暴露端口（Django 默认 8000）
EXPOSE 8000

# 启动 Django 应用（生产推荐用 gunicorn）
CMD ["gunicorn", "config.wsgi:application", "--bind", "0.0.0.0:8000"]