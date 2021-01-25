# hoge

## About

* Quick example to run a Python script as non-root =pyusr= user

## How to build

```bash
build -t sokoide/hoge .
```

## How to run

```bash
docker run -it --rm -p 5000:5000 sokoide/hoge
```

## How to test

```bash
# Run the container
curl http://localhost:5000/
Hello, World!
```
