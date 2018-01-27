#!//bin/bash

if [ -e /etc/shadow ]; then
	echo "Shadow passwords are enabled"
fi
if [ -x /etc/shadow ]; then
	echo "You have permissions to edit /et/shadow."
  elif
	echo "You do NOT have permissions to edit /etc/shadow"
fi

