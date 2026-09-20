<?php declare(strict_types=1);


// TODO: Declare domain objects
class User {
	public int $Id;
	public string $DisplayName;
	// PasswordHash omitted because we don't want to ship that around
	public $ProfilePicture;
}


// TODO: Declare read-only database capability
class ReadCapability {
	protected PDO $connection;

	public function __construct() {
		$settings = parse_ini_file('user_Read.ini');
		$this->connection = new PDO(
			'mysql:dbname=' .
			$settings['db'] .
			';host=' . $settings['host'] .
			';port=' . $settings['port'],

			$settings['user'],

			$settings['pass']
		);
	}

	public function __destruct() {
		unset($this->connection); // Dispose as soon as possible
	}

	public function getUser(int $id): User|false {
		$stmt = $this->connection->prepare(
			<<<SQL
			SELECT Id, DisplayName, ProfilePicture
			FROM User
			WHERE User.Id = :id
			SQL
			);

		$stmt->execute([':id' => $id]);
		$stmt->setFetchMode(PDO::FETCH_CLASS, 'User');
		return $stmt->fetch();
	}

	function authenticateUser($name, #[SensitiveParameter] string $password) : User|false {
		$stmt = $this->connection->prepare("SELECT * FROM `User` WHERE DisplayName = :name;");
		$stmt->execute([':name' => $name]);
		$stmt->setFetchMode(PDO::FETCH_ASSOC);
		$result = $stmt->fetch();

		if ($result === FALSE) return FALSE;

		if (password_verify($password, $result['PasswordHash'])) {
			// TODO: Check password_needs_rehash to see if we need to reset the user's password?

			// Manually construct the user because we have sensitive info in the array.
			$user = new User();
			$user->Id = (int) $result['Id'];
			$user->DisplayName = $result['DisplayName'];
			$user->ProfilePicture = $result['ProfilePicture'];

			return $user;

		} else {
			return FALSE;
		}
	}

	// TODO: More read-only database methods

}

class ReadWriteCapability extends ReadCapability {
    /** @noinspection PhpMissingParentConstructorInspection */
    public function __construct() {
		$settings = parse_ini_file('user_ReadWrite.ini');
		$this->connection = new PDO(
			'mysql:dbname=' .
			$settings['db'] .
			';host=' . $settings['host'] .
			';port=' . $settings['port'],

			$settings['user'],

			$settings['pass']
		);
	}

	function createUser(User $user, #[SensitiveParameter] string $password): int|false {
		$passwordHash = password_hash($password, PASSWORD_BCRYPT, ['cost' => 12]);
		try {
			$stmt = $this->connection->prepare(
				<<<SQL
				INSERT INTO `User`(DisplayName, PasswordHash, ProfilePicture)
				VALUES(:name, :passwordHash, NULL);
				SQL
				);
			$args = [
				':name' => $user->DisplayName,
				':passwordHash' => $passwordHash
				];

			$result = $stmt->exectue($args);

			return ($result === FALSE) ? FALSE : (int) $this->connection->lastInsertId();

		} catch (Exception $e) {
			return FALSE;
		}
	}

	// TODO: More database mutator methods go here
}

?>
