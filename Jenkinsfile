pipeline 
{ 
	agent any 
	stages 
	{ 
		stage('Build') 
		{ 
			steps 
			{ 
		 		sh 'dotnet build API.sln -p:Configration=release -v:n' 	
			} 
		} 

		stage('Test') 
		{ 
			steps 
			{ 
				sh 'dotnet test'
			} 
		}

		stage('Publish') 
		{ 
			steps 
			{ 
				sh 'dotnet publish -c Release'
			} 
		} 
		
		stage('Compress') 
		{
            		steps 
			{	
                		sh 'zip  Api.zip -r API/bin/Release/netcoreapp2.2'
            		}
        	}
		
		stage('Deploy') 
		{
            		steps 
			{              
				sh 'unzip Api.zip -d Unzip/ -y'        
            		}
        	}
		
	} 
	
}
