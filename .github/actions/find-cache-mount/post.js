// post.js: post step, runs find cache-mount
const { execSync } = require('child_process');

console.log('Post step: Listing contents of cache-mount');
try {
  const output = execSync('find cache-mount', { encoding: 'utf8' });
  console.log(output);
} catch (err) {
  console.error('Error running find cache-mount:', err.message);
}
