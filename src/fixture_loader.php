<?php
/**
 * Loads a JSON fixture and returns its contents as an array.
 *
 * @param string $name Fixture filename without .json
 * @return array Decoded fixture records
 * @throws JsonException If the fixture contains invalid JSON
 */
function loadFixture(string $name): array
{
	// Only allow simple fixture filenames.
	if (!preg_match('/^[a-z0-9-]+$/', $name)) {
		throw new InvalidArgumentException(
			'Invalid fixture name.'
		);
	}

	// Locate our data/fixtures directory.
	$path = dirname(__DIR__)
		. '/data/fixtures/'
		. $name
		. '.json';

	if (!is_file($path)) {
		throw new RuntimeException(
			"Fixture not found: {$name}"
		);
	}

	// Read the JSON file.
	$json = file_get_contents($path);

	if ($json === false) {
		throw new RuntimeException(
			"Unable to read fixture: {$name}"
		);
	}

	// Convert JSON into a PHP array.
	return json_decode(
		$json,
		true,
		512,
		JSON_THROW_ON_ERROR
	);
}
