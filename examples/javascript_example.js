#!/usr/bin/env node

/**
 * JavaScript example for using the HDKit API
 */

const https = require('http'); // Using http for localhost

// API base URL
const BASE_URL = "http://localhost:4567";

/**
 * Make HTTP request
 */
function makeRequest(method, path, data = null) {
    return new Promise((resolve, reject) => {
        const options = {
            hostname: 'localhost',
            port: 4567,
            path: path,
            method: method,
            headers: {
                'Content-Type': 'application/json'
            }
        };

        const req = https.request(options, (res) => {
            let body = '';
            res.on('data', (chunk) => {
                body += chunk;
            });
            res.on('end', () => {
                try {
                    const response = JSON.parse(body);
                    resolve({ status: res.statusCode, data: response });
                } catch (e) {
                    resolve({ status: res.statusCode, data: body });
                }
            });
        });

        req.on('error', (err) => {
            reject(err);
        });

        if (data) {
            req.write(JSON.stringify(data));
        }
        req.end();
    });
}

/**
 * Test health check
 */
async function testHealthCheck() {
    console.log("1. Health Check");
    console.log("-".repeat(30));

    try {
        const response = await makeRequest('GET', '/');
        console.log(`Status: ${response.status}`);
        console.log(`Response:`, response.data);
    } catch (error) {
        console.log(`Error: ${error.message}`);
    }
    console.log();
}

/**
 * Generate bodygraph
 */
async function generateBodygraph() {
    console.log("2. Generate Bodygraph");
    console.log("-".repeat(30));

    const data = {
        name: "Иван Иванов",
        birth_date: "25/11/1996",
        birth_time: "11:48",
        birth_country: "Bulgaria (BG)",
        birth_city: "Sofia, Bulgaria"
    };

    try {
        const response = await makeRequest('POST', '/api/bodygraph', data);
        console.log(`Status: ${response.status}`);
        console.log("Response:");
        console.log(JSON.stringify(response.data, null, 2));
    } catch (error) {
        console.log(`Error: ${error.message}`);
    }
    console.log();
}

/**
 * Generate bodygraph with local time
 */
async function generateBodygraphWithLocalTime() {
    console.log("3. Generate Bodygraph with Local Time");
    console.log("-".repeat(30));

    const data = {
        name: "Мария Петрова",
        birth_date: "15/03/1985",
        birth_time: "14:30",
        latitude: 42.1532,
        longitude: 24.7535
    };

    try {
        const response = await makeRequest('POST', '/api/bodygraph', data);
        console.log(`Status: ${response.status}`);
        console.log("Response:");
        console.log(JSON.stringify(response.data, null, 2));
    } catch (error) {
        console.log(`Error: ${error.message}`);
    }
    console.log();
}

/**
 * Main function
 */
async function main() {
    console.log("HDKit API JavaScript Example");
    console.log("=".repeat(40));
    console.log();

    await testHealthCheck();
    await generateBodygraph();
    await generateBodygraphWithLocalTime();

    console.log("Note: Make sure the API is running on localhost:4567");
}

// Run the example
main().catch(console.error);
