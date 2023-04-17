<h1>Movie Browser</h1>

<p>Movie Browser is a mobile app for iOS and Android written in Flutter. It allows users to browse, search, rate, and add movies to a favorite list.</p>

<h2>Features</h2>

<ul>
	<li>Browse popular movies and new releases</li>
	<li>Search for movies by title or keywords</li>
	<li>View movie details, including a summary, release date, runtime, and rating</li>
	<li>Rate movies on a scale of 1 to 5 stars</li>
	<li>Add movies to a favorite list for quick access later</li>
</ul>

<h2>Installation</h2>

<ol>
	<li>Clone the repository: <code>git clone https://github.com/s17476/movie_browser.git</code></li>
	<li>Install dependencies: <code>flutter pub get</code></li>
	<li>Run the app: <code>flutter run</code></li>
</ol>

<h2>API</h2>

<p>The app uses <a href="https://www.themoviedb.org/documentation/api" target="_new">The Movie Database API</a> to fetch movie data. You will need to create an account and get an API key to use the API.</p>

<p>After you obtain an API key, create a <code>secrets.dart</code> file in the <code>lib</code> directory with the following contents:</p>

<pre>
  <div class="bg-black">
    <code>const kApiKey = 'your-api-key-here';</code>
  </div>
</pre>

<p>Replace <code>your-api-key-here</code> with your actual API key.</p>

<h2>Screenshots</h2>

<div class="row">
    <img alt="Home Screen" src="https://github.com/s17476/movie_browser/blob/main/dev_assets/home.png?raw=true" style="float:left; width:33%"/>
    <img alt="Movie Details Screen" src="https://github.com/s17476/movie_browser/blob/main/dev_assets/search.png?raw=true" style="float:left; width:33%"/>
    <img alt="Search Screen" src="https://github.com/s17476/movie_browser/blob/main/dev_assets/details.png?raw=true" style="float:left; width:33%"/>
</div>

<h2>Contributing</h2>

<p>Contributions are welcome! Please create an issue or pull request if you have a suggestion or improvement.</p>

<h2>License</h2>

<p>This project is licensed under the MIT License - see the <a href="https://chat.openai.com/LICENSE" target="_new">LICENSE</a> file for details.</p>
