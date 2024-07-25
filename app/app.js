import express from 'express';

const app = express();
const port = process.env.PORT || 8080;
const host = process.env.HOST || 'localhost'

app.get('/', (_, res) => {
    res.send(`Hello, World!`);
});

app.listen(port, () => {
    console.log(`Server running at http://${host}:${port}/`);
});
