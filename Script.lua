const workspace = {
  characters: []
};

function showNotification(characterName) {
  if (!("Notification" in window)) {
    alert(`Character added: ${characterName}`);
    return;
  }

  if (Notification.permission === "granted") {
    new Notification("Character Added", {
      body: `${characterName} has been added to the workspace`,
      icon: "https://via.placeholder.com/128"
    });
  } else if (Notification.permission !== "denied") {
    Notification.requestPermission().then(permission => {
      if (permission === "granted") {
        new Notification("Character Added", {
          body: `${characterName} has been added to the workspace`,
          icon: "https://via.placeholder.com/128"
        });
      }
    });
  }
}

function addCharacter(name) {
  workspace.characters.push(name);
  showNotification(name);
  console.log(`Added ${name}. Total characters: ${workspace.characters.length}`);
}

if (Notification.permission === "default") {
  Notification.requestPermission();
}

addCharacter("Hero");
addCharacter("Villain");
addCharacter("Sidekick");
