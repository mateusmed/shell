```
public void test2() throws Exception{
		Configuration conf = HBaseConfiguration.create();
		// Option 1 (recommended): Place hbase-site.xml on src/main/resources
		// Option 2: Configure the hbase connection properties here:
		// - Zookeeper addresses
		//conf.set("hbase.zookeeper.quorum","10.112.13.19,10.112.13.18,10.112.13.17");

		conf.set("hbase.master", "127.0.0.1");
		conf.set("hbase.master.port", "16000");
		conf.set("hbase.zookeeper.quorum", "127.0.0.1");
		conf.set("hbase.rootdir", "/hbase-data");

		// - Non-default znode parent (e.g. HDP with security disabled)
		//conf.set("zookeeper.znode.parent", "/hbase-unsecure");

		// Create a connection (you can use a try with resources block)
		Connection connection = ConnectionFactory.createConnection(conf);

		// Creating a table with a random name
		Admin admin = connection.getAdmin();
		UUID uuid = UUID.randomUUID();
		TableName tableName = TableName.valueOf(uuid.toString());
		HTableDescriptor tableDescriptor = new HTableDescriptor(tableName);
		HColumnDescriptor cf = new HColumnDescriptor(Bytes.toBytes("cf"));
		tableDescriptor.addFamily(cf);
		LOGGER.info("Creating table {}", tableName);
		admin.createTable(tableDescriptor);

		// Using the table
		Table table = connection.getTable(tableName);

		LOGGER.info("Adding a row");
		Put put = new Put(Bytes.toBytes("0001"));
		put.addColumn(Bytes.toBytes("cf"), Bytes.toBytes("name"), Bytes.toBytes("Javier"));
		table.put(put);

		for (int i = 2; i < 10; i++) {
			Put p = new Put(Bytes.toBytes("000" + i));
			p.addColumn(Bytes.toBytes("cf"), Bytes.toBytes("name"), Bytes.toBytes("Javier-" + i));
			table.put(p);
		}

		LOGGER.info("Reading a row");
		Get get = new Get(Bytes.toBytes("0001"));
		Result r = table.get(get);
		byte[] value = r.getValue(Bytes.toBytes("cf"), Bytes.toBytes("name"));
		LOGGER.info("Result: Row: {} Value: {}", r, Bytes.toString(value));

		LOGGER.info("Full scan");
		Scan scan = new Scan();
		ResultScanner scanner = table.getScanner(scan);
		for (Result res : scanner) {
			LOGGER.info("Row: {}", res);
		}
		scanner.close();

		LOGGER.info("Restricted Scan");
		Scan scan2 = new Scan();
		scan2.addColumn(Bytes.toBytes("cf"), Bytes.toBytes("name"))
				.setStartRow(Bytes.toBytes("0003"))
				.setStopRow(Bytes.toBytes("0005"));
		ResultScanner scanner2 = table.getScanner(scan2);
		for (Result res2 : scanner2) {
			System.out.println(res2);
			byte[] value2 = res2.getValue(Bytes.toBytes("cf"), Bytes.toBytes("name"));
			System.out.println("Value: " + Bytes.toString(value2));
		}
		scanner2.close();

		// Close the table
		table.close();

//		// Delete the table
//		LOGGER.info("Disabling table {}", tableName);
//		admin.disableTable(tableName);
//		LOGGER.info("Deleting table {}", tableName);
//		admin.deleteTable(tableName);

		// Close the connection
		connection.close();
	}
```
