# Stage 1: Build
FROM python:3.12-slim AS builder

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN mkdir /app
WORKDIR /app

RUN pip install --upgrade pip

COPY ./requirements.txt /app

RUN pip install --no-cache-dir -r requirements.txt

# Stage 2: Productionising
FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN useradd -m -r appuser && \
    mkdir /app && \
    chown -R appuser /app && \
    mkdir /app/accounts

COPY --from=builder /usr/local/lib/python3.12/site-packages/ /usr/local/lib/python3.12/site-packages/
COPY --from=builder /usr/local/bin /usr/local/bin

WORKDIR /app

COPY --chown=appuser:appuser ./accounts ./accounts

USER appuser

EXPOSE 8000

CMD [ "gunicorn", "--bind", "0.0.0.0:8000", "--workers", "1", "accounts.wsgi:application" ]