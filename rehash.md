 Rehash and verify that the new packages are present on my system:

      greg-pc# rehash
      greg-pc# which netscape
      /usr/local/bin/netscape

      I use "rehash" because if I'm using cshell, which I probably am,
      it remembers certain things about how to find files. When
      something new gets installed, the cshell might not know where to
      find the new package. Rehash wakes up the cshell and updates
      it's cache to find things. Rehash is the trick to tell the
      cshell to go out and learn how to find things again.